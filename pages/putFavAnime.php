<?php
session_start();
require_once('connectSQL.php');
$sql="";
$commande = $pdo->prepare($sql);
$bool = $commande->execute();
if ($bool) {
    
}
?>