# CloudDrive2+Webhook 配置

> 最新版 CloudDrive2 可以直接在网页中添加 webhook 配置，新建 webhook 后，将下列代码粘贴进去，修改 base_url 为自己的 Sa 实际 IP 地址

![](https://images.symedia.top/2025/04/14/20250414164133_eb3878b4.png)

![](https://images.symedia.top/2025/04/14/20250414164149_cd0c10de.png)

```toml
# global variables: global variables are used to replace the placeholders in URL and body of the webhook
# {device_name} - The name of the device
# {user_name} - Current user name
# {version} - The version of the application
# {event_category} - The category of the event
# {event_name} - The name of the event
# {event_time} - The time of the event occurred, unix epoch time in seconds
# {send_time} - The time of the data sent, unix epoch time in seconds

# global parameters
[global_params]
# The base URL of the server to send the data to, the server must be able to receive POST requests
base_url = "http://localhost:8095"
# Whether the webhook is enabled
enabled = true

# The default http headers
[global_params.default_headers]
content-type = "application/json"
user-agent = "clouddrive2/{version}"
authorization = "basic usernamepassword"

# File system watcher webhook configuration
[file_system_watcher]
# The URL of the server to send the data to, the server must be able to receive POST requests
url = "{base_url}/api/v1/webhook/clouddrive2/file_notify?device_name={device_name}&user_name={user_name}&type={event_name}"
# http method, can be "GET" or "POST", if not specified, the default value is POST
method = "POST"
# Whether the file system watcher is enabled
enabled = true
# The body to be sent to the server can be a JSON string
# The following is a sample template for the data to be sent
# the json string should contains at least an array of file changes, each file change item shoud contain the following fields
# {event_category} - The category of the event is "file"
# {event_name} - The name of the event is "notify"
# {action} - The action of file change (create, delete, rename)
# {is_dir} - Whether the file is a directory (false: file, true: directory)
# {source_file} - The source file's path of the action
# {destination_file} - The destination file's path of the action, only valid for action rename(move)
body = '''
{
  "device_name": "{device_name}",
  "user_name": "{user_name}",
  "version": "{version}",
  "event_category": "{event_category}",
  "event_name": "{event_name}",
  "event_time": "{event_time}",
  "send_time": "{send_time}",
  "data": [
      {
        "action": "{action}",
        "is_dir": "{is_dir}",
        "source_file": "{source_file}",
        "destination_file": "{destination_file}"
      }
  ]
}
'''
# specify additional http headers for the file system watcher request if required, headers with same name will override in the default headers
[file_system_watcher.headers]
additional_header = "value"

# mount point watcher configuration
[mount_point_watcher]
# The URL of the server to send the data to, the server must be able to receive POST requests
url = "{base_url}/api/v1/webhook/clouddrive2/mount_notify?device_name={device_name}&user_name={user_name}&type={event_name}"
# http method
method = "POST"
# Whether the mount point watcher is enabled
enabled = true
# The body to be sent to the server can be a JSON string
# The following is a sample template for the data to be sent
# the mount_point_watcher should contains at least an array of mount point changes, each mount point change item shoud contain the following fields
# {event_category} - The category of the event is "mount_point"
# {event_name} - The name of the event is "mount" or "unmount"
# {action} - The action of mount point change (mount, unmount)
# {mount_point} - The mount point's path of the action
# {status} - The status of the action (true for success, false for failed)
# {reason} - The failed reason, empty string means success
body = '''
{
  "device_name": "{device_name}",
  "user_name": "{user_name}",
  "version": "{version}",
  "event_category": "{event_category}",
  "event_name": "{event_name}",
  "event_time": "{event_time}",
  "send_time": "{send_time}",
  "data": [
      {
        "action": "{action}",
        "mount_point": "{mount_point}",
        "status": "{status}",
        "reason": "{reason}"
      }
  ]
}
'''
# specify additional http headers for the file system watcher request if required, headers with same name will override in the default headers
[mount_point_watcher.headers]
user-agent = "clouddrive2/{version}/mount"
```
