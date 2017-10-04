
#### Requirements
* jq
    * sudo apt-get install -y jq

#### Create hourly paid vps on simplecloud.ru

    $.post('/servers/add/', 'dc_id=3&vps_title=&vps_password=&pay_period=1h&disk_type=&vps_os=1&vps_os_version=221&tariff_plans=1&speed_limit_disabled=&prosto_plesk=1&add_server=1', function (response) { if (typeof response.error != 'undefined' && !response.error) { console.log("Created"); } else { console.log(response.message); } });

#### Another way to create hourly paid vps on simplecloud.ru

    window.location.replace("/servers/add/");

    console.log("start creating vps");
    $('#dc_tmp').val(3); //
    $('#vps_title_tmp').val(""); //
    $('#pay_period_tmp').val("1h"); //
    $('#os_version').val(1); //
    $('#pay_period_tmp').append('<p class="virtual-os-version-list_item active">Test</p>');
    $('.virtual-os-version-list_item.active').data('id', 221); // 221
    $('.tarif-box.active').parent().attr('id', 1);
    $('#answer-task').prop('checked', true);
    prepare_add_server();
    console.log("end creating vps");
    
#### Steps
* Init your simplecloud.ru secret
    * ```export TOKEN=YOUR_TOKEN```
* Add your ssh key to simplecloud.ru that will be added to al created servers
* Create a few servers via UI or as mentioned above (you should prove you identity to be able to create more than 4 vps)
* Install docker on servers
    * commands/provisioning/install-docker.sh
* Check that docker works on all servers if wanted to
    * commands/provisioning/check-docker.sh
* Run service on all servers
    * commands/provisioning/run-docker-service.sh
* Gather logs of all services
    * commands/provisioning/logs-docker-service.sh
* Remove all servers
    * commands/provisioning/rm-allvps.sh
