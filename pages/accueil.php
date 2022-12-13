<?php

session_start();
$pseudo = isset($_SESSION['pseudo'])?($_SESSION['pseudo']):'';

require("header.tpl");
require ("accueil.tpl");

?>
