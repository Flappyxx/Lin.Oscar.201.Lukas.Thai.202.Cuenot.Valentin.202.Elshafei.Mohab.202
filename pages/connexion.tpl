<!DOCTYPE html>
<html>  
 <head>  
  <meta charset="utf-8">
  <link src="global.css">
  <title>Titre de la page</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 </head>  
<body>  
    <header>
        <div>Titre</div>
    </header>

    <form action="connexion.php" method="post">
        <label>Pseudo : </label><input name="pseudo" type="text" value= "<?= $pseudo?>">
        <br>
        <label>Mot de passe : </label><input name="mdp" type="text" value= "<?= $mdp?>">
        <br>
        <input type="submit" value="Confirmer">
    </form>
    <div class="error"><?php echo "$msg"?></div>


</body>
</html>