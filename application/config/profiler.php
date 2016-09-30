<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| Profiler Sections
| -------------------------------------------------------------------------
| This file lets you determine whether or not various sections of Profiler
| data are displayed when the Profiler is enabled.
| Please see the user guide for info:
|
|	https://codeigniter.com/user_guide/general/profiling.html
|
*/

$config['memory_usage'] = FALSE;
$config['get'] = FALSE;
$config['uri_string'] = FALSE;
$config['controller_info'] = FALSE;
$config['session_data'] = FALSE;
$config['http_headers'] = FALSE;
$config['config'] = FALSE;

