#!/usr/bin/perl

# Assuming that current duractory is:
# WTSD_DucatiMMSW/ext_rel/dcc_xmls/mono/
# or :
# WTSD_DucatiMMSW/ext_rel/dcc_xmls/common/

use File::Copy;
my $bindest = "..\/..\/dcc_binaries/";
my $ducati_fw_to_dcc = "..\/..\/..\/framework\/msp_dcc_server\/inc\/fw_to_dcc.h";
    opendir (DIR, '.') or die;
    foreach $folder (readdir DIR){
        if (-d $folder) {
            opendir NEST, $folder or die;
                foreach my $xmlfile (grep {/.xml$/} readdir NEST){
#                system "dcc_gen_win_basic.exe $folder\\$xmlfile";
                print "Parsing file: $folder\/$xmlfile";
                system "dccgen $folder\/$xmlfile $ducati_fw_to_dcc";
                }
                print "\nAfterXMLs\n";
            
            closedir NEST or die;
        }
    }
    closedir DIR or die;
    opendir (DIR, '.') or die;
    foreach $folder (readdir DIR){
        if (-d $folder) {
        opendir NEST, $folder or die;
        foreach my $file (grep {/.bin$/} readdir NEST){
                    copy($folder . "\/" . $file, $bindest . $file) or die "$bindest | $file";
                }
            closedir NEST or die;
        }
    }
    closedir DIR or die;
    opendir (DIR, '.') or die;
    foreach $folder (readdir DIR){
        if (-d $folder) {
        opendir NEST, $folder or die;
        foreach my $file (grep {/.bin$/} readdir NEST){
                 unlink ($folder . "\/" . $file);
                }
            closedir NEST or die;
        }
    }
    closedir DIR or die;
