<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Random" %>
<%
    Integer nombreSecret = (Integer) session.getAttribute("nombreSecret");
    if (nombreSecret == null) {
        nombreSecret = new Random().nextInt(100) + 1;
        session.setAttribute("nombreSecret", nombreSecret);
    }
%>
<html>
<head>
    <title>Les conditions</title>
</head>
<body bgcolor="white">
    <h1>Exercices sur les conditions</h1>

    <form action="#" method="post">
        <p>Saisir la valeur 1 : <input type="text" name="valeur1"></p>
        <p>Saisir la valeur 2 : <input type="text" name="valeur2"></p>
        <p>Saisir la valeur 3 : <input type="text" name="valeur3"></p>
        <p><input type="submit" value="Afficher"></p>
    </form>

    <%-- Récupération des valeurs saisies --%>
    <% String valeur1 = request.getParameter("valeur1"); %>
    <% String valeur2 = request.getParameter("valeur2"); %>
    <% String valeur3 = request.getParameter("valeur3"); %>

    <% if (valeur1 != null && valeur2 != null && valeur3 != null) { %>
        <%-- Conversion des valeurs en entiers --%>
        <% 
            int intValeur1 = Integer.parseInt(valeur1); 
            int intValeur2 = Integer.parseInt(valeur2); 
            int intValeur3 = Integer.parseInt(valeur3); 
        %>

        <%-- Comparaison des trois valeurs --%>
        <h2>Comparaison des valeurs</h2>
        <% if (intValeur3 >= Math.min(intValeur1, intValeur2) && intValeur3 <= Math.max(intValeur1, intValeur2)) { %>
            <p>La valeur 3 (<%= intValeur3 %>) est comprise entre Valeur 1 (<%= intValeur1 %>) et Valeur 2 (<%= intValeur2 %>).</p>
        <% } else { %>
            <p>La valeur 3 (<%= intValeur3 %>) n'est pas comprise entre Valeur 1 (<%= intValeur1 %>) et Valeur 2 (<%= intValeur2 %>).</p>
        <% } %>

        <%-- Exercice 2 : Pair ou Impair --%>
        <h2>Exercice 2 : Pair ou Impair</h2>
        <p>Valeur 1 (<%= intValeur1 %>) est <% out.print((intValeur1 % 2 == 0) ? "Pair" : "Impair"); %>.</p>
        <p>Valeur 2 (<%= intValeur2 %>) est <% out.print((intValeur2 % 2 == 0) ? "Pair" : "Impair"); %>.</p>
        <p>Valeur 3 (<%= intValeur3 %>) est <% out.print((intValeur3 % 2 == 0) ? "Pair" : "Impair"); %>.</p>
    <% } %> 

    <%-- Exercice 3 : Devinez le nombre --%>
    <h2>Exercice 3 : Devinez le nombre</h2>
    <form action="#" method="post">
        <p>Devinez le nombre (entre 1 et 100) : <input type="text" name="devine" required></p>
        <p><input type="submit" value="Deviner"></p>
    </form>

    <%
        String devineStr = request.getParameter("devine");
        if (devineStr != null && !devineStr.isEmpty()) {
            try {
                int devine = Integer.parseInt(devineStr);

                if (devine < 1 || devine > 100) {
                    out.println("<p style='color: red;'>Veuillez entrer un nombre entre 1 et 100.</p>");
                } else {
                    if (devine < nombreSecret) {
                        out.println("<p style='color: blue;'>Votre nombre (" + devine + ") est trop petit.</p>");
                    } else if (devine > nombreSecret) {
                        out.println("<p style='color: blue;'>Votre nombre (" + devine + ") est trop grand.</p>");
                    } else {
                        out.println("<p style='color: green;'>Bravo ! Vous avez trouvé le nombre secret (" + nombreSecret + ").</p>");
                        session.removeAttribute("nombreSecret"); 
                    }
                }
            } catch (NumberFormatException e) {
                out.println("<p style='color: red;'>Veuillez saisir un nombre valide.</p>");
            }
        }
    %>

    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
