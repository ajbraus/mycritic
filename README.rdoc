To get started 

brew install rails and postgres

git clone git@github.com:ajbraus/wni.git

cd wni

bundle install

create a new postgres role:
in the command line type:

psql template1
create role wni with createdb login password 'wni';
\q; 

Then type in:

rake db:create
rake db:migrate
thin start

now direct your browser to localhost:3000

