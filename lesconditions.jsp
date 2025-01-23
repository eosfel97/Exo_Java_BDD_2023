<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les conditions</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les conditions</h1>
<form action="#" method="post">
    <p>Saisir la valeur 1 : <input type="text" id="inputValeur" name="valeur1"></p>
    <p>Saisir la valeur 2 : <input type="text" id="inputValeur" name="valeur2"></p>
    <p><input type="submit" value="Afficher"></p>
</form>

<%-- Récupération des valeurs --%>
<% String valeur1 = request.getParameter("valeur1"); %>
<% String valeur2 = request.getParameter("valeur2"); %>

<% if (valeur1 != null && valeur2 != null) { %>
    <%-- Conversion des valeurs en entiers pour la comparaison --%>
    <% int intValeur1 = Integer.parseInt(valeur1); %>
    <% int intValeur2 = Integer.parseInt(valeur2); %>
    
    <%-- Comparaison des deux valeurs --%>
    <% if (intValeur1 > intValeur2) { %>
        <p>Valeur 1 est supérieure à Valeur 2.</p>
    <% } else if (intValeur1 < intValeur2) { %>
        <p>Valeur 1 est inférieure à Valeur 2.</p>
    <% } else { %>
        <p>Valeur 1 est égale à Valeur 2.</p>
    <% } %>

    <%-- Exercice 1 : Comparaison 1 --%>
    <h2>Exercice 1 : Comparaison 1</h2>
    <form action="#" method="post">
        <p>Saisir la valeur A : <input type="text" name="valeurA"></p>
        <p>Saisir la valeur B : <input type="text" name="valeurB"></p>
        <p>Saisir la valeur C : <input type="text" name="valeurC"></p>
        <p><input type="submit" value="Vérifier"></p>
    </form>
    <%
        String valeurA = request.getParameter("valeurA");
        String valeurB = request.getParameter("valeurB");
        String valeurC = request.getParameter("valeurC");

        if (valeurA != null && valeurB != null && valeurC != null) {
            int intA = Integer.parseInt(valeurA);
            int intB = Integer.parseInt(valeurB);
            int intC = Integer.parseInt(valeurC);

            if (intC >= intA && intC <= intB) {
                out.println("<p>Oui, C est compris entre A et B.</p>");
            } else {
                out.println("<p>Non, C n'est pas compris entre A et B.</p>");
            }
        }
    %>

    <%-- Exercice 2 : Pair ou Impair --%>
    <h2>Exercice 2 : Pair ou Impair ?</h2>
    <%
        if (intValeur1 % 2 == 0) {
            out.println("<p>Valeur 1 est Pair.</p>");
        } else {
            out.println("<p>Valeur 1 est Impair.</p>");
        }

        if (intValeur2 % 2 == 0) {
            out.println("<p>Valeur 2 est Pair.</p>");
        } else {
            out.println("<p>Valeur 2 est Impair.</p>");
        }
    %>

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
