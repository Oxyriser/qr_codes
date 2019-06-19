# QR-codes reconfigurables

## QRM_API
* /qrcode
  * POST: Entrer une nouvelle url a raccourcir et obtenir son _id_
    * _url_, nécessaire.


* /qrcode/{id}
  * GET: Renvoie l'_url_ pointée par _id_.
    * _style_, optionnel.
  * PUT: pour remplacer le qr code par un nouveau.
    * *new_url*, necessaire.
    * *new_style*, optionnel.
  * DELETE: pour le supprimer.


* /qrcode/{id}/style (pour eviter de fragmenter les stats qd on change les styles)
  * GET: revoie le syle.
  * PUT: réactualise le style.
    * *new_style*, necessaire.


* /qrcode/{id}/stats
  * GET: renvoie les stats associées, *qr_stats* (nombres, addresses historiques)


* /qrcode/{id}/vues
  * GET: raccourci vers le nombre de _vues_.


* /me ( pas frocément utile... à voir)
  * GET:
    * renvoie l'utilisateur couran, _user_, si il est bien connecté
  * DELETE: supprimer l'utilisateur


* /me/list
  * GET: renvoie la liste des _id_,   *id_list* des qr codes de l'utilisateur


* /me/stats
  * GET: renvoie les stats, *user_stats* liées à l'utilisateur

### Notes: 
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

