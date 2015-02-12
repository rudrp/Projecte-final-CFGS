<?php
/* @var $this UsuarisController */
/* @var $model Usuaris */

$this->breadcrumbs=array(
	'Usuarises'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Usuaris', 'url'=>array('index')),
	array('label'=>'Create Usuaris', 'url'=>array('create')),
	array('label'=>'View Usuaris', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Usuaris', 'url'=>array('admin')),
);
?>

<h1>Update Usuaris <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>