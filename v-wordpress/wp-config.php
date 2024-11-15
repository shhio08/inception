<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress_db' );

/** Database username */
define( 'DB_USER', 'wordpress_user' );

/** Database password */
define( 'DB_PASSWORD', 'password' );

/** Database hostname */
define( 'DB_HOST', 'db' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

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
define( 'AUTH_KEY',         'BQ|i*$i@MHdYekM[gs6#SPm.tFv9*D=rS6!y!Y<8rg}*fXcH$k<YmdwkQN1uJFs-' );
define( 'SECURE_AUTH_KEY',  'j YIgR+]}BG_j`aDC*&A:4[}AObALI;S^HO;d]y:B)$EqVMo}rM%8gOKQ&*It 5?' );
define( 'LOGGED_IN_KEY',    'E-7i</vP7<HRA~Ou6qiWg8A2oIU8bGy4_wpO#NP)YDNB~=nu/Ad!X5).~czVGT+)' );
define( 'NONCE_KEY',        ';H8&u|Z(_ed8$l76pmhRg-PZ9S}XohV0]O4.9%l9U!XEJQ;dM.X^Vuc482f>*H.x' );
define( 'AUTH_SALT',        'H;31?LLa@Bh3]RsVJxS[1~Q:F<P7c=@]K7u-KkCh_/20X]y-AnkUwpXYQM?|%Twz' );
define( 'SECURE_AUTH_SALT', ':#Re;[!R#+}L/Ezg6a$tl~; b&_aTp7+~+>b<&sHr=yeocy7d|7[d?1< 2,Q@^>b' );
define( 'LOGGED_IN_SALT',   '+EiAh&+J5+0PS`h,~ZP[#5sHv@G+}BGM|,fEi66w)K=lZ,!uh=d>H`g6&YDA~LXv' );
define( 'NONCE_SALT',       'L*x,9.`>vxu[l0?kNdRml?K6_#fh7)xQ:vBLn=Qt6C}=j$Q5f4P%Q>Ya1I C>p- ' );

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
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
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
