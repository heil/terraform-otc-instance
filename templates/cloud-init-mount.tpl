#cloud-config
disk_setup:
  ${device}:
    table_type: 'mbr'
    layout:
      - 100
    overwrite: false

fs_setup:
  - label: ${label != "" ? label : "data"}
    filesystem: ${filesystem}
    overwrite: false

mounts:
  - [ ${device}1, "${mount_point}" ]
