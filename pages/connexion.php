
<?php

session_start();

$pseudo =  isset($_POST['pseudo'])?($_POST['pseudo']):'';
$mdp =  isset($_POST['mdp'])?($_POST['mdp']):'';
$msg = "";

if  (count($_POST)==0){
    require ("connexion.tpl");}
else{
    $profil = array();
    if  (!verif_ident($pseudo,$mdp)) {
        $msg ="Mot de passe incorrect";
        require ("connexion.tpl") ;
    }
    else { 
        $_SESSION['pseudo'] = $pseudo;
        $url = "accueil.php";
        header("Location:" . $url) ;
    }
}


function verif_ident($pseudo,$mdp){
    require('connectSQL.php');
    $sql="SELECT * FROM utilisateur 
    WHERE Identifiant=:pseudo";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':pseudo', $pseudo);
        $bool = $commande->execute();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
        }
    }
    catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die(); 
    }
    if (count($resultat)== 0){ 
        return register($pseudo,$mdp);
    }
    else {
        return password_verify($mdp,$resultat[0]['Password']);
    }
}

function register($pseudo,$mdp){
    require('connectSQL.php');
    $sql="INSERT INTO utilisateur VALUES(:pseudo,:mdp)";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':pseudo', $pseudo);
        $commande->bindParam(':mdp', password_hash($mdp,PASSWORD_DEFAULT));
        $bool = $commande->execute();
    }
    catch (PDOException $e) {
        echo utf8_encode("Echec de insert : " . $e->getMessage() . "\n");
        die(); 
    }
    return $bool;
}

?>
