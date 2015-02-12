<?php
/* @var $this PartidaController */
/* @var $model Partida */

$this->breadcrumbs=array(
	'Partidas'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Partida', 'url'=>array('index')),
	array('label'=>'Manage Partida', 'url'=>array('admin')),
);
?>

<h1>Create Partida</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>