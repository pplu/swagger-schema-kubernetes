requires 'Swagger::Schema';
requires 'MooseX::DataModel';
requires 'namespace::autoclean';

on test => sub {
  requires 'Test::More';
};
