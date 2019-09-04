# QrManager

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

