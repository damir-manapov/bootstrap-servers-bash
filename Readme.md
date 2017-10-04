
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
