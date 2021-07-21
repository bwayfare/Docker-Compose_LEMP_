<?php
define( 'DB_NAME', 'CONF_NAME' );
define( 'DB_USER', 'CONF_USER' );
define( 'DB_PASSWORD', 'CONF_PASS' );
define( 'DB_HOST', 'CONF_HOST' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );


define( 'AUTH_KEY',         'put your unique phrase here' );
define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
define( 'NONCE_KEY',        'put your unique phrase here' );
define( 'AUTH_SALT',        'put your unique phrase here' );
define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
define( 'NONCE_SALT',       'put your unique phrase here' );

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
  define( 'ABSPATH', dirname( FILE ) . '/' );
}

require_once( ABSPATH . 'wp-settings.php' );