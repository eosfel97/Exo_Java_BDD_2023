<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>les conditions</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les conditions</h1>
<form action="#" method="post">
    <p>Saisir la valeur 1 : <input type="text" id="inputValeur" name="valeur1">
    <p>Saisir la valeur 2 : <input type="text" id="inputValeur" name="valeur2">
    <p><input type="submit" value="Afficher">
</form>
<%-- Récupération des valeurs --%>
    <% String valeur1 = request.getParameter("valeur1"); %>
    <% String valeur2 = request.getParameter("valeur2"); %>

    <%-- Vérification de la condition entre les deux valeurs --%>
    <% if (valeur1 != null && valeur2 != null) { %>
        <%-- Conversion des valeurs en entiers pour la comparaison --%>
        <% int intValeur1 = Integer.parseInt(valeur1); %>
        <% int intValeur2 = Integer.parseInt(valeur2); %>
        
        <%-- Condition if pour comparer les valeurs --%>
        <% if (intValeur1 > intValeur2) { %>
            <p>Valeur 1 est supérieure à Valeur 2.</p>
        <% } else if (intValeur1 < intValeur2) { %>
            <p>Valeur 1 est inférieure à Valeur 2.</p>
        <% } else { %>
            <p>Valeur 1 est égale à Valeur 2.</p>
        <% } %>
   
    
<h2>Exercice 1 : Comparaison 1</h2>
<p>Ecrire un programme qui demande à l'utilisateur de saisir 3 valeurs (des chiffres),</br>
A, B et C et dites nous si la valeur de C est comprise entre A et B.</br>
Exemple :</br>
A = 10</br>
B = 20</br>
C = 15</br>
Oui C est compris entre A et B</p>

<h2>Exercice 2 : Pair ou Impair ?</h2>
<p>Écrivez un programme pour vérifier si un nombre est pair ou impair en utilisant une structure if</p>
<% if (intValeur1 % 2 ==0 ) { %>
    <p>Valeur 1 estPair.</p>
<% } else   { %>
    <p>Valeur 1 est Impair</p>
<% } %>

<% if (intValeur2 % 2 ==0 ) { %>
    <p>Valeur 2 estPair.</p>
<% } else   { %>
    <p>Valeur 2 est Impair</p>
<% } %>
<%-- Exercice 3 : Devinez le chiffre ? --%>
<h2>Exercice 3 : Devinez le chiffre ?</h2>
<form action="#" method="post">
    <p>Saisir un nombre entre 1 et 100 pour deviner le chiffre secret :</p>
    <input type="text" name="devinerChiffre">
    <input type="submit" value="Deviner">
</form>

<% 
    // Générer un nombre secret aléatoire entre 1 et 100
    int nombreSecret = (int) (Math.random() * 100) + 1;
    String devinerChiffre = request.getParameter("devinerChiffre");

    // Vérifier si un nombre a été saisi pour deviner
    if (devinerChiffre != null) {
        int chiffreSaisi = Integer.parseInt(devinerChiffre);

        if (chiffreSaisi < nombreSecret) {
            out.println("<p>Le nombre que vous avez saisi est trop petit. Essayez encore !</p>");
        } else if (chiffreSaisi > nombreSecret) {
            out.println("<p>Le nombre que vous avez saisi est trop grand. Essayez encore !</p>");
        } else {
            out.println("<p>Félicitations ! Vous avez deviné le bon nombre : " + nombreSecret + ".</p>");
        }
    }
%>
<% } %>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
