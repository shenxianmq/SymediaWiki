#!/bin/bash
# CD2 一键部署脚本 (Shell 版本)

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 日志函数
info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
    exit 1
}

# 检查命令是否存在
check_command() {
    if ! command -v "$1" >/dev/null 2>&1; then
        error "$1 命令未找到，请先安装"
    fi
}

# 展开路径（处理 ~ 等）
expand_path() {
    local path="$1"
    # 展开 ~
    path="${path/#\~/$HOME}"
    # 尝试使用 realpath（如果可用）
    if command -v realpath >/dev/null 2>&1; then
        realpath "$path" 2>/dev/null || echo "$path"
    else
        # 回退方案：如果是绝对路径直接返回，否则尝试转换
        if [[ "$path" == /* ]]; then
            echo "$path"
        else
            local dir=$(dirname "$path")
            local base=$(basename "$path")
            if [ -d "$dir" ]; then
                echo "$(cd "$dir" && pwd)/$base"
            else
                echo "$path"
            fi
        fi
    fi
}

# 获取 cd2-start-mitm-ca.sh 脚本内容
get_cd2_script_content() {
    cat <<'EOF'
#!/bin/sh

set -e

echo "CloudDrive2 - $0"

update_ca() {
  echo "正在更新 CA 证书..."
  update-ca-certificates
  echo "更新 CA 证书成功"
}

set_apk_mirror() {
  if [ -n "$OTHER_APK_MIRROR" ] && [ ! -f "/etc/apk/repositories.bak" ]; then
    echo "Set apk mirror to $OTHER_APK_MIRROR"
    cp /etc/apk/repositories /etc/apk/repositories.bak
    sed -i "s/dl-cdn.alpinelinux.org/${OTHER_APK_MIRROR}/g" /etc/apk/repositories
  fi
}

reset_apk_mirror() {
  if [ -n "$OTHER_APK_MIRROR" ] && [ -f "/etc/apk/repositories.bak" ]; then
    echo "Set apk mirror back to default."
    mv /etc/apk/repositories.bak /etc/apk/repositories
    rm -f /etc/apk/repositories.bak
  fi
}

install_packages() {
  set_apk_mirror

  apk add ca-certificates

  reset_apk_mirror
}

if command -v update-ca-certificates >/dev/null 2>&1; then
    update_ca
else
    echo "update-ca-certificates 命令不存在，先安装 ca-certificates..."

    install_packages

    update_ca
fi
EOF
}

# 修改 systemsettings.json
modify_systemsettings() {
    local systemsettings_file="$1"
    local container_config_path="$2"
    local script_path="sh ${container_config_path}/cd2-start-mitm-ca.sh"
    
    # 如果文件不存在，创建空对象
    if [ ! -f "$systemsettings_file" ]; then
        warn "systemsettings.json 不存在，正在创建..."
        echo "{}" > "$systemsettings_file"
    fi
    
    # 使用 jq 修改 JSON（如果可用）
    if command -v jq >/dev/null 2>&1; then
        # 使用 jq 添加或更新 run_after_start
        jq --arg script "$script_path" '. + {run_after_start: $script}' "$systemsettings_file" > "${systemsettings_file}.tmp" && \
        mv "${systemsettings_file}.tmp" "$systemsettings_file"
        info "systemsettings.json 已更新（使用 jq）"
    else
        # 如果没有 jq，使用 Python 处理
        python3 <<PYTHON_SCRIPT
import json
import sys

try:
    with open("$systemsettings_file", "r", encoding="utf-8") as f:
        data = json.load(f)
except (json.JSONDecodeError, FileNotFoundError):
    data = {}

data["run_after_start"] = "$script_path"

with open("$systemsettings_file", "w", encoding="utf-8") as f:
    json.dump(data, f, indent=2, ensure_ascii=False)
PYTHON_SCRIPT
        info "systemsettings.json 已更新（使用 Python）"
    fi
    
    info "  run_after_start: $script_path"
}

# 主函数
main() {
    echo ""
    info "=== CD2 一键部署脚本 (Shell 版本) ==="
    echo ""
    
    # 检查必要的命令
    info "检查必要的命令..."
    check_command "python3"
    
    # 获取用户输入
    read -p "请输入 Config 文件夹路径（宿主机路径）: " config_path
    config_path=$(expand_path "$config_path")
    
    if [ ! -d "$config_path" ]; then
        warn "Config 目录不存在，正在创建: $config_path"
        mkdir -p "$config_path"
    fi
    
    # 容器内 Config 路径固定为 /Config
    container_config_path="/Config"
    
    info "Config 映射: $config_path -> $container_config_path"
    
    # 获取证书文件路径
    read -p "请输入 mitmproxy 证书文件路径: " cert_file
    cert_file=$(expand_path "$cert_file")
    
    if [ ! -f "$cert_file" ]; then
        error "证书文件不存在: $cert_file"
    fi
    
    info "找到证书文件: $cert_file"
    
    # 复制证书文件到 config 目录
    info "复制证书文件到 config 目录..."
    cert_target="${config_path}/mitmproxy.crt"
    cp "$cert_file" "$cert_target"
    info "证书文件已复制: $cert_target"
    
    # 写入脚本文件
    info "写入脚本文件到 config 目录..."
    target_script="${config_path}/cd2-start-mitm-ca.sh"
    get_cd2_script_content > "$target_script"
    chmod +x "$target_script"
    info "脚本文件已写入: $target_script"
    
    # 修改 systemsettings.json
    systemsettings_file="${config_path}/systemsettings.json"
    modify_systemsettings "$systemsettings_file" "$container_config_path"
    
    # 显示配置摘要和需要添加的内容
    echo ""
    info "=== 配置摘要 ==="
    echo "1. 证书文件已复制到: $cert_target"
    echo "2. 脚本文件已创建: $target_script"
    echo "3. systemsettings.json 已更新: run_after_start 已配置"
    echo ""
    
    info "=== 请在 docker-compose.yml 中添加以下配置 ==="
    echo ""
    echo "环境变量："
    echo "  environment:"
    echo "    - ENABLE_RUN_AFTER_START=true"
    echo ""
    echo "证书映射（volumes）："
    echo "  volumes:"
    echo "    - ${cert_target}:/usr/local/share/ca-certificates/mitmproxy.crt:ro"
    echo ""
    
    info "完成！请手动修改 docker-compose.yml 并重新部署容器。"
}

# 运行主函数
main "$@"
