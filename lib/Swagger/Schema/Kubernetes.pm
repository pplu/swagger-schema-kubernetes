use Swagger::Schema;

package Swagger::Schema::KubernetesGroupVersionKind;
  use MooseX::DataModel;

  key group => (isa => 'Str', required => 1);
  key kind => (isa => 'Str', required => 1);
  key version => (isa => 'Str', required => 1);

package Swagger::Schema::KubernetesOperation;
  use MooseX::DataModel;
  extends 'Swagger::Schema::Operation';

  key x_kubernetes_action => (isa => 'Str', location => 'x-kubernetes-action');
  key x_kubernetes_group_version_kind => (isa => 'Swagger::Schema::KubernetesGroupVersionKind', location => 'x-kubernetes-group-version-kind');

package Swagger::Schema::KubernetesPath;
  use MooseX::DataModel;
  extends 'Swagger::Schema::Path';
  use namespace::autoclean;

  key get => (isa => 'Swagger::Schema::KubernetesOperation');
  key put => (isa => 'Swagger::Schema::KubernetesOperation');
  key post => (isa => 'Swagger::Schema::KubernetesOperation');
  key delete => (isa => 'Swagger::Schema::KubernetesOperation');
  key options => (isa => 'Swagger::Schema::KubernetesOperation');
  key head => (isa => 'Swagger::Schema::KubernetesOperation');
  key patch => (isa => 'Swagger::Schema::KubernetesOperation');

package Swagger::Schema::KubernetesSchema;
  use MooseX::DataModel;
  extends 'Swagger::Schema::Schema';

  object properties => (isa => 'Swagger::Schema::KubernetesSchema');

  array x_kubernetes_list_map_keys => (isa => 'Str', location => 'x-kubernetes-list-map-keys');
  key x_kubernetes_list_type => (isa => 'Str', location => 'x-kubernetes-list-type');
  key x_kubernetes_patch_merge_key => (isa => 'Str', location => 'x-kubernetes-patch-merge-key');
  key x_kubernetes_patch_strategy => (isa => 'Str', location => 'x-kubernetes-patch-strategy');

package Swagger::Schema::Kubernetes;
  use MooseX::DataModel;
  extends 'Swagger::Schema';
  object paths => (isa => 'Swagger::Schema::KubernetesPath', required => 1);
  object definitions => (isa => 'Swagger::Schema::KubernetesSchema');

1;
