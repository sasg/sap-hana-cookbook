default['hana']['installpath']    = "/usr/sap"
default['hana']['datapath']       = ""
default['hana']['logpath']        = ""
default['hana']['sid']            = "HNA"
default['hana']['instance']       = "00"
default['hana']['userid']         = "1099"
default['hana']['password']       = "Start1234"
default['hana']['syspassword']    = "Start1234"
default['hana']['checkhardware']  = "true"
default['hana']['checkstoignore'] = "check_platform,check_diskspace,check_min_mem"
default['hana']['clientsid']      = "true"
default['hana']['import_content'] = "on"
default['hana']['nostart']        = "off"
default['hana']['hostname']       = ""

# HANA HDI needs parameterized autostart/xs_engine, because want to set off
default['hana']['autostart']      = "on"
default['hana']['xs_engine']      = "on"

# needed for S4H
default['s4h']['install']['repo'] = "http://moo-repo.wdf.sap.corp:8080/static/monsoon/sap/s4h"
default[:s4h][:product]           = "pc"
default[:s4h][:version]           = "1506"
default[:s4h][:media] = ['DBLOG',
                         'DBDATA',
                         'DBEXE']
default[:s4h][:media_dir]         = "/sapinst/files"
default[:s4h][:db][:passsourse] = 'VA1MPwd_'
##default[:saplvm][:mountpoint][:first] = "/hana"
# # Moved to readymade-sapproducts, not to mess things up for all other SAP installations

## S4H needs all files in /hana/... and not /usr/sap

# needed for distributed hana cluster
default['hana']['dist']['sharedvolume']         = ""
default['hana']['dist']['sharedmountoptions']   = ""
default['hana']['dist']['master-mode-required'] = "false"
default['hana']['dist']['waitcount']            = 5
default['hana']['dist']['waittime']             = 5

# needed for dist upgrade prcess on worker
default['hana']['dist']['2ndroot']              = "toor"
default['hana']['dist']['2ndrootclearpwd']      = "Toor1234"
default['hana']['dist']['2ndrootpwd']           = "$1$ytOMGuiO$KAPtio4Eh7JK0Rm4EAPzL/"

# xs attributes
default['hana']['import_content'] = "on"
default['hana']['xs_http_port']   = "80" + node['hana']['instance']
default['hana']['xs_https_port']  = "443"

default['install']['tempdir']               = "/monsoon/tmp"

default['install']['repo']                  = "http://moo-repo.wdf.sap.corp:8080/static/monsoon/hana/newdb"
default['install']['productiondevice1']     = "derotvi0157.wdf.sap.corp:/derotvi0157a_ld9252/q_files"
default['install']['productiondevice2']     = "nsvf1735.wdf.sap.corp:/vol/nsvf1735a_newdb/q_newdb"
default['install']['productiondevice3']     = "derotvi0010.wdf.sap.corp:/derotvi0010a_LCAPPS/q_files"

default['install']['productionmountpoint1'] = "/sapmnt/production/makeresults/newdb_archive"
default['install']['productionmountpoint2'] = "/sapmnt/production/newdb"
default['install']['productionmountpoint3'] = "/sapmnt/production/NEWDB_SDK"
default['hana']['revision'] 					= '090'

# download sapcar executable ...
default['install']['files']['sapcar']               = "http://moo-repo.wdf.sap.corp:8080/static/monsoon/hana/newdb/SAPCAR"
default['install']['files']['hostagent']            = "http://moo-repo.wdf.sap.corp:8080/static/monsoon/saphostagent/lnx_x64/7.2SP160/SAPHOSTAGENT.SAR"
default['install']['files']['sapcryptolib']         = "http://moo-repo.wdf.sap.corp:8080/static/monsoon/sap/sapcryptolib/SAPCRYPTOLIB_34-10010845.SAR"

# construct url from install repo
default['install']['files']['hanadb']               = node['install']['repo'] + "/1.0." + node['hana']['revision'] + "/SAP_HANA_DATABASE100_" + node['hana']['revision'] + "_Linux_on_x86_64.SAR"
default['install']['files']['hanaclient']           = node['install']['repo'] + "/1.0." + node['hana']['revision'] + "/SAP_HANA_CLIENT100_" + node['hana']['revision'] + "_Linux_on_x86_64.SAR"
default['install']['files']['lifecyclemngr']        = "http://moo-repo.wdf.sap.corp:8080/static/monsoon/hana/newdb/SAPHANALM07P_12-10012745.SAR"
default['install']['files']['hanalifecyclemngr']    = node['install']['files']['lifecyclemngr']
default['install']['files']['saphostagent']         = node['install']['files']['hostagent']
default['install']['files']['afl']                  = node['install']['repo'] + "/1.0." + node['hana']['revision'] + "/SAP_HANA_AFL100_" + node['hana']['revision'] + "_1" + "_Linux_on_x86_64.SAR"
default['install']['files']['afl_sal']              = "http://moo-repo.wdf.sap.corp:8080/static/monsoon/hana/bobj/lumira/SAP_SAL_AFL_PATCH_1_FOR_SAP_HANA.SAR"

# dataset information
default['install']['files']['datasetsources']       = "http://moo-repo.wdf.sap.corp:8080/static/ssc/SAP/Dataset/"
default['install']['files']['datasetnames']         = ["LUMIRA.zip"]
default['install']['files']['deletedatasetsources'] = true


# HANA HA
default[:hana][:ha][:repo_baseurl]        = 'http://moo-repo.wdf.sap.corp:8080/mrepo/suse/11/'
default[:hana][:ha][:repo_paths]          = [ "SLE11-HAE-SP3-Pool/sle-11-x86_64/SLE11-HAE-SP3-Pool", "SLE11-HAE-SP3-Updates/sle-11-x86_64/SLE11-HAE-SP3-Updates"]
default[:hana][:ha][:packadges]           = [ "corosync","hawk","sle-hae-release","pssh","cmirrord","sleha-bootstrap","conntrack-tools","crmsh","python-dateutil","ldirectord","ocfs2-tools","csync2","openais","ctdb","drbd","yast2-cluster","python-pssh","yast2-drbd","yast2-iplb","pacemaker","pacemaker-mgmt","pacemaker-mgmt-client","release-notes-hae","resource-agents","lvm2-clvm" ]


default[:hana][:ha][:custom_repo_baseurl] = 'http://moo-repo.wdf.sap.corp:8080/static/monsoon/sap/hana-ha/'
default[:hana][:ha][:custom_packadges]    = [ "SAPHanaSR-0.148-0.7.1.noarch.rpm", "SAPHanaSR-doc-0.148-0.7.1.noarch.rpm" ]
default[:hana][:ha][:tags]                = ["hana_ha_master1", "hana_ha_master2"]