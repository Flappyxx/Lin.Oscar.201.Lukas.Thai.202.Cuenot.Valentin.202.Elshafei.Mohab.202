<?php
session_start();
$pseudo = isset($_SESSION['pseudo'])?($_SESSION['pseudo']):'';
$id =  isset($_POST['id'])?($_POST['id']):'';


require_once('connectSQL.php');
$sql="UPDATE utilisateur SET IdAnimeFav = ? WHERE Identifiant = ?";
$commande = $pdo->prepare($sql);
$commande->execute([$id,$pseudo]);
?>