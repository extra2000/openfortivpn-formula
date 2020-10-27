# openfortivpn-formula

| License | Versioning | Build |
| ------- | ---------- | ----- |
| [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) | [![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release) | [![Build Status](https://travis-ci.com/extra2000/openfortivpn-formula.svg?branch=master)](https://travis-ci.com/extra2000/openfortivpn-formula) |

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
