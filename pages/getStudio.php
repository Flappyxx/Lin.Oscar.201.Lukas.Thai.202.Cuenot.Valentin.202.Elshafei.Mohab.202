
<?php
session_start();
require_once('connectSQL.php');
$sql="SELECT Latitude, Longitude FROM  Studio";
$commande = $pdo->prepare($sql);
$bool = $commande->execute();
if ($bool) {
        $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
	echo json_encode($resultat);
}
?>
