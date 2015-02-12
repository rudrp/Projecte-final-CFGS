<?php
/* @var $this RankingController */
/* @var $model Ranking */

$this->breadcrumbs=array(
	'Rankings'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Ranking', 'url'=>array('index')),
	array('label'=>'Create Ranking', 'url'=>array('create')),
	array('label'=>'Update Ranking', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Ranking', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Ranking', 'url'=>array('admin')),
);
?>

<h1>View Ranking #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'usuari_id',
		'usuari_guanyades_id',
		'usuari_perdudes_id',
		'score',
	),
)); ?>
