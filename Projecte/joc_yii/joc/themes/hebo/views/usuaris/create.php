<?php
/* @var $this UsuarisController */
/* @var $model Usuaris */

$this->breadcrumbs=array(
	'Usuarises'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Usuaris', 'url'=>array('index')),
	array('label'=>'Manage Usuaris', 'url'=>array('admin')),
);
?>

<h1>Create Usuaris</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>