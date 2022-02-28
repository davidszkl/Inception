<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress_db' );

/** Database username */
define( 'DB_USER', 'wpuser' );

/** Database password */
define( 'DB_PASSWORD', 'db_pwd' );

/** Database hostname */
define( 'DB_HOST', 'mariadb_cont' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */

define('AUTH_KEY',         '>2|-&xP|!Rm<y_doZT5*>oV6pSDPHNRw1RloN};`rf|3Mh-ojURXRN$7|.H2^0$n');
define('SECURE_AUTH_KEY',  'J ^Z/7NyPCBkc19;T?fxpd+*E6@r1W]|f>So<mQXkf4b71|X4W6v[kyHFZzo q?P');
define('LOGGED_IN_KEY',    'c%-X%hYz3>Yd7Xa}hFUWbJ]62+s{L[bICdi:Q<JJH$O1;}inGvL!] uH0f8g>Hr*');
define('NONCE_KEY',        '(aH|e1,_4as|Yh^5pCMZi2|n?L5R[+{lZO{=`A08aR|+jmt5`v.^e:J~IFY&|!sh');
define('AUTH_SALT',        'GTIoP>/ibnLeR,)/AXpWP):+v KTm?8C>>B.gMOn)gdm{pv3)(,&4Cd#-HRYCZm2');
define('SECURE_AUTH_SALT', 'K`fa$=;GABvj5?:A{#-`Li2Y2tn<f=.>V 9{LxE3Xhpff.7O)N7xKbV;z.lJYAvu');
define('LOGGED_IN_SALT',   '@tNcQ7Z|ALn}d&dS<:Sa?$J+g]UjqoE?k5e<k{P>d%`#aj%H;YI6V1sC2=1(vxM^');
define('NONCE_SALT',       ']~Mni[<nz{4pytvCp3Z.ha#f-Xc?p&|AK}4l+6<Dd1HFEamG|Z(ZRkhB64l ^Bd(');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
