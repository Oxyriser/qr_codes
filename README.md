# QrManager

<<<<<<< HEAD
To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
=======

## QRM_API

Depuis __qrmanager.rfc1149.net/api/v1__

* /qrcode
  * POST: Entrer une nouvelle _url_ a raccourcir et obtenir son _id_
    * _url_, nécessaire.
    * _style_, facultatif.


* /qrcode/{id}
  * GET: Renvoie l'_url_ pointée par _id_.
  * PUT: pour remplacer le qr code par un nouveau.
    * _url_, facultatif. Si url n'est pas présent ou identique, le nouveau style est appliqué sans  que cela change les statistiques.
    * _style_, facultatif.
  * DELETE: pour le supprimer.


* /qrcode/{id}/stats
  * GET: renvoie les stats associées, *qr_stats* (nombres, addresses historiques)


* /qrcode/{id}/vues
  * GET: raccourci vers le nombre de _vues_.


* /me
  * GET: renvoie l'utilisateur courant, _user_, si il est bien connecté
  * DELETE: supprimer l'utilisateur


* /me/list
  * GET: renvoie la liste des _id_,   *id_list* des qr codes de l'utilisateur


* /me/stats
  * GET: renvoie les stats, *user_stats* liées à l'utilisateur

### Notes sur la pagination: 
Dans l'éventualité où l'on crérait des montagnes de QRcodes par personnes, la reponse de /me/list pourrait être vraiment trop large. Il faudrait dans ce cas la rajouter les paramètres _limit_, nombre limite dans la requete, et _offset_, décalage dans la requête, pour obetenir la liste en plusieures requêtes.

### Todo:
format des objects retournés par les requetes:

* _url_
* _id_
* _style_
* *id_list*
* _vues_
* _user_
* *user_stats*
* *qr_stats*

>>>>>>> front-jgarde
