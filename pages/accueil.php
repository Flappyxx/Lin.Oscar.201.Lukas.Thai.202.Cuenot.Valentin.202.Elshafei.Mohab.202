<?php

session_start();
$pseudo = isset($_SESSION['pseudo'])?($_SESSION['pseudo']):'';

if($pseudo == ''){
    require("connexion.php");
}
else {
require("header.tpl");
require("accueil.tpl");
}

?>
