# Ansible Role: ViMbAdmin

[![Build Status](https://travis-ci.org/tschifftner/ansible-role-vimbadmin.svg)](https://travis-ci.org/tschifftner/ansible-role-vimbadmin)

Installs [ViMbAdmin](http://www.vimbadmin.net/) on Debian/Ubuntu linux servers.

## Requirements

The following programs need to be installed prior running this role:

 - [nginx](https://github.com/tschifftner/ansible-role-nginx)
 - [php5-fpm](https://github.com/tschifftner/ansible-role-php5-fpm)
 - [mariadb](https://github.com/tschifftner/ansible-role-mariadb)
 - [composer](https://github.com/tschifftner/ansible-role-composer)

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

```
# Database
vimbadmin_sql_host: "127.0.0.1'"
vimbadmin_sql_database: "vimbadmin"
vimbadmin_sql_user: "vimbadmin"
vimbadmin_sql_password: "strong-password"
```

### Security

All security strings must be 24 characters!

```
# Salts
vimbadmin_securitysalt: ''
vimbadmin_rememberme_salt: ''
vimbadmin_password_salt: ''
```

### Nginx

If your `{{ ansible_hostname }}` is correctly configured the url will be
`https://ansible_hostname:444` by default

```
# Nignx
vimbadmin_nginx_listen: '444'
vimbadmin_nginx_server_name: '{{ ansible_hostname }}'

vimbadmin_nginx_ssl_redirect: 'https://{{ vimbadmin_nginx_server_name }}$request_uri'
vimbadmin_nginx_ssl_save_path: '{{ vimbadmin_working_dir }}/.ssl'

vimbadmin_nginx_ssl_certificate: '{{ mailserver_ssl_certificate | default(omit) }}'
vimbadmin_nginx_ssl_certificate_key: '{{ mailserver_ssl_certificate_key | default(omit) }}'
vimbadmin_nginx_ssl_intermediate_certificate: '{{ mailserver_ssl_intermediate_certificate | default(omit) }}'
vimbadmin_nginx_ssl_root_certificate: '{{ mailserver_ssl_intermediate_certificate | default(omit) }}'

vimbadmin_nginx_ssl_certificate_path: '{{ vimbadmin_nginx_ssl_save_path }}/certificate.crt'
vimbadmin_nginx_ssl_certificate_key_path: '{{ vimbadmin_nginx_ssl_save_path }}/certificate.key'
vimbadmin_nginx_ssl_trusted_certificate_path: '{{ vimbadmin_nginx_ssl_save_path }}/trustchain.crt'
```

## Dependencies

None.

## Example Playbook

    - hosts: server
      roles:
        - { role: tschifftner.nginx }
        - { role: tschifftner.php5-fpm }
        - { role: tschifftner.composer }
        - { role: tschifftner.mariadb }
        - { role: tschifftner.vimbadmin }

## Supported OS
Ansible          | Debian Jessie    | Ubuntu 14.04    | Ubuntu 12.04
:--------------: | :--------------: | :-------------: | :-------------: 
2.1              | Yes              | Yes             | Yes

## License

[MIT License](http://choosealicense.com/licenses/mit/)

## Author Information

 - [Tobias Schifftner](https://twitter.com/tschifftner), [ambimax® GmbH](https://www.ambimax.de)