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
define( 'DB_NAME', 'WordPress_db' );

/** Database username */
define( 'DB_USER', 'db' );

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
define( 'AUTH_KEY',         'sDM`H:@92V!.J/=fv?vMmPmn}]xUBF?9bi4 Gw5R+!(UZ_/kms;qm;|:w=Th:|Y1' );
define( 'SECURE_AUTH_KEY',  'l7FT^aAA+-cBe4!Ifp) ]U_orGf#K;g@C)=f% ?3XUDS80O3v.j-BA%h(=,mUo>:' );
define( 'LOGGED_IN_KEY',    'w;Kd)%jD*uhcX-RAXE{}QS?}p1;Af;TS[464M|g;5WccHi;5$LMnZT`WE%wzGMj:' );
define( 'NONCE_KEY',        'MX7++aG#v#m`#2Ej]8T<etjs=Qs24vXB~O]tK;[j@c3N0Mn{yvMQ<T;3qh&.A4W$' );
define( 'AUTH_SALT',        '&zVPF39 D>Z(<o^mz7!,pc/Za.^*y#5RS3&gtzAqD]9%4<d_ 7.~7`ML`0,|g%hL' );
define( 'SECURE_AUTH_SALT', '=3x~8~GTxS7+}iB}9koNm$AZUT<N`<b6DBr@z2v>oCk2i%T8(Kx*19-fS9b-{~{!' );
define( 'LOGGED_IN_SALT',   '#a7eQ6GO+T[``N[uI@v:!V7)U$EOy/&`Owq+YI<Aipttf!svt%K67jV}>/bFgE^$' );
define( 'NONCE_SALT',       '4VSf?~+Oi~,s[6)`]bte9:iCE-@=h<5XPbIc.Fo<@/~zpF&@>-rbK-QJPESs1hca' );

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
