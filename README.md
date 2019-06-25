# QR-codes reconfigurables


## QRM_API

Depuis __qrmanager.rfc1149.net/api/v1__

* /
  * DELETE: supprime l'utilisateur 

* /url
  * GET: obtient la liste des urls
  * POST: creer une nouvelle redirection
    * _url_ necessaire
  * DELETE: supprime tout les code de l'utilisateur.

* /url/id
   * GET: obtient {url, new_url}
   * PUT: remplace {url, new_url}
     * _url_ necessaire
   * DELETE

* /url/stats
  * GET

* /url/id/stats
  * GET


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

