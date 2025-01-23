<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les tableaux</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les tableaux</h1>
<form action="#" method="post">
    <p>Saisir au minimum 3 chiffres à la suite, exemple : 6 78 15</p>
    <input type="text" id="inputValeur" name="chaine">
    <p><input type="submit" value="Afficher"></p>
</form>

<%-- Récupération des valeurs saisies --%>
<% String chaine = request.getParameter("chaine"); %>

<% if (chaine != null) { %>
    <%-- Conversion des valeurs saisies en un tableau d'entiers --%>
    <% 
        String[] tableauDeChiffres = chaine.split("\\s+"); 
        int[] valeurs = new int[tableauDeChiffres.length];
        for (int i = 0; i < tableauDeChiffres.length; i++) {
            valeurs[i] = Integer.parseInt(tableauDeChiffres[i]);
        }
    %>

    <h2>Résultats :</h2>
    <p>Vous avez saisi <%= valeurs.length %> valeurs :</p>
    <ul>
        <% for (int i = 0; i < valeurs.length; i++) { %>
            <li>Valeur <%= i + 1 %> : <%= valeurs[i] %></li>
        <% } %>
    </ul>

    <%-- Exercice 1 : Le carré de la première valeur --%>
    <h2>Exercice 1 : Le carré de la première valeur</h2>
    <p>Le carré de la première valeur (<%= valeurs[0] %>) est : <%= valeurs[0] * valeurs[0] %></p>

    <%-- Exercice 2 : La somme des 2 premières valeurs --%>
    <h2>Exercice 2 : La somme des 2 premières valeurs</h2>
    <p>La somme des deux premières valeurs (<%= valeurs[0] %> et <%= valeurs[1] %>) est : <%= valeurs[0] + valeurs[1] %></p>

    <%-- Exercice 3 : La somme de toutes les valeurs --%>
    <h2>Exercice 3 : La somme de toutes les valeurs</h2>
    <% 
        int sommeTotale = 0;
        for (int valeur : valeurs) {
            sommeTotale += valeur;
        }
    %>
    <p>La somme de toutes les valeurs est : <%= sommeTotale %></p>

    <%-- Exercice 4 : La valeur maximale --%>
    <h2>Exercice 4 : La valeur maximale</h2>
    <% 
        int max = valeurs[0];
        for (int valeur : valeurs) {
            if (valeur > max) {
                max = valeur;
            }
        }
    %>
    <p>La valeur maximale est : <%= max %></p>

    <%-- Exercice 5 : La valeur minimale --%>
    <h2>Exercice 5 : La valeur minimale</h2>
    <% 
        int min = valeurs[0];
        for (int valeur : valeurs) {
            if (valeur < min) {
                min = valeur;
            }
        }
    %>
    <p>La valeur minimale est : <%= min %></p>

    <%-- Exercice 6 : La valeur la plus proche de 0 --%>
    <h2>Exercice 6 : La valeur la plus proche de 0</h2>
    <% 
        int plusProcheDeZero = valeurs[0];
        for (int valeur : valeurs) {
            if (Math.abs(valeur) < Math.abs(plusProcheDeZero)) {
                plusProcheDeZero = valeur;
            }
        }
    %>
    <p>La valeur la plus proche de 0 est : <%= plusProcheDeZero %></p>

    <%-- Exercice 7 : La valeur la plus proche de 0 (2° version) --%>
    <h2>Exercice 7 : La valeur la plus proche de 0 (2° version)</h2>
    <% 
        int plusProcheDeZeroV2 = valeurs[0];
        for (int valeur : valeurs) {
            if (Math.abs(valeur) < Math.abs(plusProcheDeZeroV2) || 
                (Math.abs(valeur) == Math.abs(plusProcheDeZeroV2) && valeur > plusProcheDeZeroV2)) {
                plusProcheDeZeroV2 = valeur;
            }
        }
    %>
    <p>La valeur la plus proche de 0 (version 2) est : <%= plusProcheDeZeroV2 %></p>
<% } %>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
