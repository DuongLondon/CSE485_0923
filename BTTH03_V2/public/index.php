<?php
require_once ('../config/config.php');
require_once APP_ROOT.'/controllers/AuthorController.php';
$AuthorController = new AuthorController();
$AuthorController->index();