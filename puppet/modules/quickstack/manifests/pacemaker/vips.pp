define quickstack::pacemaker::vips(
  $public_vip,
  $private_vip,
  $admin_vip,
  $pcmk_group = $title,
  ) {

  pacemaker::resource::ip { "ip-${pcmk_group}_${public_vip}":
    ip_address => "$public_vip",
    group => "$pcmk_group",
  }

  if ( $public_vip != $private_vip ) { 
    pacemaker::resource::ip { "ip-${pcmk_group}_${private_vip}":
      ip_address => "$private_vip",
      group      => "$pcmk_group",
    }
  }

  if ( ($admin_vip != $private_vip) and ($admin_vip != $public_vip) ) { 
    pacemaker::resource::ip { "ip-${pcmk_group}_${admin_vip}":
      ip_address => "$admin_vip",
      group      => "$pcmk_group",
    }
  }
}
