-- Base de dades Tienda

-- 1. Llista el nom de tots els productos que hi ha en la taula producto.
    SELECT nombre FROM producto;
-- 2. Llista els noms i els preus de tots els productos de la taula producto.
    SELECT nombre, precio FROM producto;
-- 3. Llista totes les columnes de la taula producto.
    SELECT * FROM producto;
-- 4. Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD).
    SELECT nombre, CONCAT(precio, " €"), concat(round(precio*1.21,2), "$") FROM producto;
-- 5. Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD).
-- Utilitza els següents àlies per a les columnes: nom de producto, euros, dolars.
    SELECT nombre AS "nom del producte", CONCAT(precio, " €") AS "euros", concat(round(precio*1.21,2), "$") AS "dòlars" FROM producto;
-- 6. Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a majúscula.
    SELECT  UPPER(nombre) AS "producto",  precio FROM producto;
-- 7. Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a minúscula.
    SELECT  LOWER(nombre) AS "producto",  precio FROM producto;
-- 8. Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules 
-- els dos primers caràcters del nom del fabricant.
    SELECT nombre, SUBSTR(nombre,1, 2)  FROM fabricante;
-- 9. Llista els noms i els preus de tots els productos de la taula producto, arrodonint el valor del preu.
    SELECT nombre, round(precio, 1) AS "precio" FROM producto;
-- 10. Llista els noms i els preus de tots els productos de la taula producto, truncant el valor del preu
--  per a mostrar-lo sense cap xifra decimal.
    SELECT nombre, round(precio) AS "precio" FROM producto;
-- 11. Llista el codi dels fabricants que tenen productos en la taula producto.
    SELECT f.codigo FROM fabricante AS f, producto AS p  WHERE f.codigo = p.codigo_fabricante;
-- 12. Llista el codi dels fabricants que tenen productos en la taula producto, eliminant els codis que apareixen repetits.
    SELECT f.codigo FROM fabricante as f, producto as p  WHERE f.codigo = p.codigo_fabricante GROUP BY f.codigo;
-- 13. Llista els noms dels fabricants ordenats de manera ascendent.
    SELECT nombre FROM fabricante ORDER BY nombre ASC;
-- 14. Llista els noms dels fabricants ordenats de manera descendent.
    SELECT nombre FROM fabricante ORDER BY nombre DESC;
-- 15. Llista els noms dels productos ordenats en primer lloc pel nom de manera ascendent i en segon lloc pel preu de manera descendent.
    SELECT nombre, precio FROM fabricante ORDER BY nombre ASC,  precio DESC ;
-- 16. Retorna una llista amb les 5 primeres files de la taula fabricante.
    SELECT * FROM fabricante LIMIT 5;
-- 17. Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. 
-- La quarta fila també s'ha d'incloure en la resposta.
    SELECT * FROM fabricante LIMIT 3, 2;
-- 18. Llista el nom i el preu del producto més barat. 
-- (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY
   SELECT nombre, MIN(precio) AS 'precio más barato' FROM producto; 
-- 19. Llista el nom i el preu del producto més car. (Utilitzi solament les clàusules ORDER BY i LIMIT). 
-- NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
    SELECT nombre, precio AS 'precio más caro' FROM producto ORDER BY precio DESC LIMIT 1;
-- 21. Llista el nom de tots els productos del fabricant el codi de fabricant del qual és igual a 2.
    SELECT nombre FROM producto  WHERE codigo_fabricante = 2;
-- 22. Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
    SELECT p.nombre, p.precio, f.nombre FROM producto AS p, fabricante as f WHERE p.codigo_fabricante = f.codigo;
-- 23. Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. 
-- Ordeni el resultat pel nom del fabricador, per ordre alfabètic.
    SELECT p.nombre, p.precio, f.nombre FROM producto AS p, fabricante as f WHERE p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC;
-- 24. Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, 
-- de tots els productes de la base de dades.
    SELECT p.codigo_fabricante, p.nombre, f.codigo, f.nombre FROM producto AS p, fabricante as f WHERE p.codigo_fabricante = f.codigo;
-- 25. Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
    SELECT p.nombre, p.precio AS 'precio más barato', f.nombre AS 'fabricante' FROM producto AS p, fabricante as f WHERE p.codigo_fabricante = f.codigo ORDER BY precio ASC LIMIT 1;
-- 26. Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
    SELECT p.nombre, p.precio AS 'precio más caro', f.nombre AS 'fabricante' FROM producto AS p, fabricante as f WHERE p.codigo_fabricante = f.codigo ORDER BY precio DESC LIMIT 1;
-- 27. Retorna una llista de tots els productes del fabricador Lenovo.
    SELECT p.nombre, p.precio  FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Lenovo";
-- 28. Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200€.
    SELECT p.nombre, max(p.precio) AS maximo  FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Crucial";
-- 29. Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Sense utilitzar l'operador IN.
    SELECT p.nombre, p.precio, f.nombre  FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Asus" || f.nombre = "Hewlett-Packard";
-- 30. Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Utilitzant l'operador IN.

-- Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
-- Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
-- Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180€. Ordeni el resultat en primer lloc pel preu (en ordre descendent) i en segon lloc pel nom (en ordre ascendent)
-- Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
-- Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
-- Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
-- Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
-- Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricador Lenovo. (Sense utilitzar INNER JOIN).