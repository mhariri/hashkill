/* ocl_support.h
 *
 * hashkill - a hash cracking tool
 * Copyright (C) 2010 Milen Rangelov <gat3way@gat3way.eu>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 */


#ifndef OCL_SUPPORT_H
#define OCL_SUPPORT_H

#include <stdint.h>
#include "err.h"
//#include "hashinterface.h"

/* md5 plugin support */
hash_stat ocl_bruteforce_md5(void);
hash_stat ocl_markov_md5(void);
hash_stat ocl_rule_md5(void);

/* sha1 plugin support */
hash_stat ocl_bruteforce_sha1(void);
hash_stat ocl_markov_sha1(void);
hash_stat ocl_rule_sha1(void);

/* md4 plugin support */
hash_stat ocl_bruteforce_md4(void);
hash_stat ocl_markov_md4(void);
hash_stat ocl_rule_md4(void);

/* ntlm plugin support */
hash_stat ocl_bruteforce_ntlm(void);
hash_stat ocl_markov_ntlm(void);
hash_stat ocl_rule_ntlm(void);

/* md5md5 plugin support */
hash_stat ocl_bruteforce_md5md5(void);
hash_stat ocl_markov_md5md5(void);
hash_stat ocl_rule_md5md5(void);

/* sl3 plugin support */
hash_stat ocl_bruteforce_sl3(void);

/* mysql5 plugin support */
hash_stat ocl_bruteforce_mysql5(void);
hash_stat ocl_markov_mysql5(void);
hash_stat ocl_rule_mysql5(void);

/* mysql-old plugin support */
//hash_stat ocl_bruteforce_mysql_old(void);
//hash_stat ocl_markov_mysql_old(void);
//hash_stat ocl_rule_mysql_old(void);

/* ldap-sha plugin support */
hash_stat ocl_bruteforce_ldap_sha(void);
hash_stat ocl_markov_ldap_sha(void);
hash_stat ocl_rule_ldap_sha(void);

/* ldap-ssha plugin support */
hash_stat ocl_bruteforce_ldap_ssha(void);
hash_stat ocl_markov_ldap_ssha(void);
hash_stat ocl_rule_ldap_ssha(void);


/* sha256 plugin support */
hash_stat ocl_bruteforce_sha256(void);
hash_stat ocl_markov_sha256(void);
hash_stat ocl_rule_sha256(void);

/* sha512 plugin support */
hash_stat ocl_bruteforce_sha512(void);
hash_stat ocl_markov_sha512(void);
hash_stat ocl_rule_sha512(void);


/* md5-passsalt plugin support */
hash_stat ocl_bruteforce_md5_passsalt(void);
hash_stat ocl_markov_md5_passsalt(void);
hash_stat ocl_rule_md5_passsalt(void);

/* lm plugin support */
hash_stat ocl_bruteforce_lm(void);
hash_stat ocl_markov_lm(void);
hash_stat ocl_rule_lm(void);

/* oracle-old plugin support */
hash_stat ocl_bruteforce_oracle_old(void);
hash_stat ocl_markov_oracle_old(void);
hash_stat ocl_rule_oracle_old(void);

/* oracle11g plugin support */
hash_stat ocl_bruteforce_oracle11g(void);
hash_stat ocl_markov_oracle11g(void);
hash_stat ocl_rule_oracle11g(void);

/* ipb2 plugin support */
hash_stat ocl_bruteforce_ipb2(void);
hash_stat ocl_markov_ipb2(void);
hash_stat ocl_rule_ipb2(void);

/* vbulletin plugin support */
hash_stat ocl_bruteforce_vbulletin(void);
hash_stat ocl_markov_vbulletin(void);
hash_stat ocl_rule_vbulletin(void);

/* md5-saltpass plugin support */
hash_stat ocl_bruteforce_md5_saltpass(void);
hash_stat ocl_markov_md5_saltpass(void);
hash_stat ocl_rule_md5_saltpass(void);

/* smf plugin support */
hash_stat ocl_bruteforce_smf(void);
hash_stat ocl_markov_smf(void);
hash_stat ocl_rule_smf(void);

/* desunix plugin support */
hash_stat ocl_bruteforce_desunix(void);
hash_stat ocl_markov_desunix(void);
hash_stat ocl_rule_desunix(void);

/* phpbb3 plugin support */
hash_stat ocl_bruteforce_phpbb3(void);
hash_stat ocl_markov_phpbb3(void);
hash_stat ocl_rule_phpbb3(void);

/* wordpress plugin support */
hash_stat ocl_bruteforce_wordpress(void);
hash_stat ocl_markov_wordpress(void);
hash_stat ocl_rule_wordpress(void);

/* md5unix plugin support */
hash_stat ocl_bruteforce_md5unix(void);
hash_stat ocl_markov_md5unix(void);
hash_stat ocl_rule_md5unix(void);

/* sha512unix plugin support */
hash_stat ocl_bruteforce_sha512unix(void);
hash_stat ocl_markov_sha512unix(void);
hash_stat ocl_rule_sha512unix(void);


/* osxlion plugin support */
hash_stat ocl_bruteforce_osxlion(void);
hash_stat ocl_markov_osxlion(void);
hash_stat ocl_rule_osxlion(void);

/* pixmd5 plugin support */
hash_stat ocl_bruteforce_pixmd5(void);
hash_stat ocl_markov_pixmd5(void);
hash_stat ocl_rule_pixmd5(void);

/* mssql-2000 plugin support */
hash_stat ocl_bruteforce_mssql_2000(void);
hash_stat ocl_markov_mssql_2000(void);
hash_stat ocl_rule_mssql_2000(void);

/* mssql-2005 plugin support */
hash_stat ocl_bruteforce_mssql_2005(void);
hash_stat ocl_markov_mssql_2005(void);
hash_stat ocl_rule_mssql_2005(void);

/* mscash plugin support */
hash_stat ocl_bruteforce_mscash(void);
hash_stat ocl_markov_mscash(void);
hash_stat ocl_rule_mscash(void);

/* apr1 plugin support */
hash_stat ocl_bruteforce_apr1(void);
hash_stat ocl_markov_apr1(void);
hash_stat ocl_rule_apr1(void);

/* mscash2 plugin support */
hash_stat ocl_bruteforce_mscash2(void);
hash_stat ocl_markov_mscash2(void);
hash_stat ocl_rule_mscash2(void);

/* zip plugin support */
hash_stat ocl_bruteforce_zip(void);
hash_stat ocl_markov_zip(void);
hash_stat ocl_rule_zip(void);

/* wpa plugin support */
hash_stat ocl_bruteforce_wpa(void);
hash_stat ocl_markov_wpa(void);
hash_stat ocl_rule_wpa(void);

/* rar plugin support */
hash_stat ocl_bruteforce_rar(void);
hash_stat ocl_markov_rar(void);
hash_stat ocl_rule_rar(void);

/* dmg plugin support */
hash_stat ocl_bruteforce_dmg(void);
hash_stat ocl_markov_dmg(void);
hash_stat ocl_rule_dmg(void);

/* osx-old plugin support */
hash_stat ocl_bruteforce_osx_old(void);
hash_stat ocl_markov_osx_old(void);
hash_stat ocl_rule_osx_old(void);



/* sl3 plugin support */
//hash_stat ocl_bruteforce_bitcoin(void);



/* supported plugins struct array*/
struct ocl_supported_plugins_s
{
    int is_linear;
    char plugin_name[32];
    hash_stat (*bruteforce_routine)(void);
    hash_stat (*markov_routine)(void);
    hash_stat (*rule_routine)(void);
};






#endif