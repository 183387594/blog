<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Default Filesystem Disk
    |--------------------------------------------------------------------------
    |
    | Here you may specify the default filesystem disk that should be used
    | by the framework. A "local" driver, as well as a variety of cloud
    | based drivers are available for your choosing. Just store away!
    |
    | Supported: "local", "ftp", "s3", "rackspace"
    |
    */

    'default' => 'qiniu',

    /*
    |--------------------------------------------------------------------------
    | Default Cloud Filesystem Disk
    |--------------------------------------------------------------------------
    |
    | Many applications store files both locally and in the cloud. For this
    | reason, you may specify a default "cloud" driver here. This driver
    | will be bound as the Cloud disk implementation in the container.
    |
    */

    'cloud' => 's3',

    /*
    |--------------------------------------------------------------------------
    | Filesystem Disks
    |--------------------------------------------------------------------------
    |
    | Here you may configure as many filesystem "disks" as you wish, and you
    | may even configure multiple disks of the same driver. Defaults have
    | been setup for each driver as an example of the required options.
    |
    */

    'disks' => [

        'local' => [
            'driver' => 'local',
            'root' => storage_path('app'),
        ],

        'public' => [
            'driver' => 'local',
            'root' => storage_path('app/public'),
            'url' => env('APP_URL').'/storage',
            'visibility' => 'public',
        ],

        's3' => [
            'driver' => 's3',
            'key' => env('AWS_KEY'),
            'secret' => env('AWS_SECRET'),
            'region' => env('AWS_REGION'),
            'bucket' => env('AWS_BUCKET'),
        ],

        'upyun' => [
            'driver'        => 'upyun',
            'bucket'        => env('UPYUN_BUCKET'),
            'operator'      => env('UPYUN_OPERATOR'),
            'password'      => env('UPYUN_PASSWORD'),
            'domain'        => env('UPYUN_DOMAIN'),
            'protocol'      => env('UPYUN_PROTOCOL'),
        ],
		'qiniu' => [
			'driver'  => 'qiniu',
				'domains' => [
					'default'   => 'or0z8sgc6.bkt.clouddn.com', //你的七牛域名
					'https'     => 'dn-yourdomain.qbox.me',         //你的HTTPS域名
					'custom'    => 'http://or0z8sgc6.bkt.clouddn.com',                //你的自定义域名
				 ],
				'access'	=>	'public',
				'access_key'=> 'Z0Ymca21_ym9ci3Gjiq3hCi2vROOBPNs5zpo6-Zr',  //AccessKey
				'secret_key'=> 'QoS-tKdqmBN3mdXkWHeFL3qdVjgItfuAmC2XPph2',  //SecretKey
				'bucket'    => 'blog',  //Bucket名字
				'notify_url'=> '',  //持久化处理回调地址
		],
    ],

];
