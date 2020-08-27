# openfortivpn-formula

SaltStack Formula for OpenFortiVPN.


## Available states

| States | Descriptions |
| ------ | ------------ |
| `openfortivpn` | Executes `./init.sls` which will install and deploy OpenFortiVPN client. |
| `openfortivpn.clean` | Executes `./clean.sls` which will stop OpenFortiVPN client and uninstall. |
| `openfortivpn.package` | Install OpenFortiVPN client. |
| `openfortivpn.package.clean` | Uninstall OpenFortiVPN client. |
| `openfortivpn.config` | Generate configs and startup scripts for OpenFortiVPN client. |
| `openfortivpn.config.clean` | Remove configs and startup scripts for OpenFortiVPN client. |
| `openfortivpn.service` | Start and enable OpenFortiVPN client service. |
| `openfortivpn.service.clean` | Stop and disable OpenFortiVPN client service. |
