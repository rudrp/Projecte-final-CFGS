<?php
/* @var $this PartidaController */
/* @var $model Partida */

$this->breadcrumbs=array(
	'Partidas'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Partida', 'url'=>array('index')),
	array('label'=>'Create Partida', 'url'=>array('create')),
	array('label'=>'Update Partida', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Partida', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Partida', 'url'=>array('admin')),
);
?>

<h1>View Partida #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'data',
		'enemics',
		'winner_id',
		'loser_id',
		'temps',
	),
)); ?>
