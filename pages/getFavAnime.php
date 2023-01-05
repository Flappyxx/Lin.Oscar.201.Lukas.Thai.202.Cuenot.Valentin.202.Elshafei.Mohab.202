<?php
session_start();
$pseudo = isset($_SESSION['pseudo'])?($_SESSION['pseudo']):'';

require_once('connectSQL.php');
$sql="SELECT IdAnimeFav FROM  utilisateur WHERE Identifiant = ?";
$commande = $pdo->prepare($sql);
$bool = $commande->execute([$pseudo]);
if ($bool) {
    $resultat = $commande->fetch(PDO::FETCH_ASSOC);
	echo json_encode($resultat);
}
?>