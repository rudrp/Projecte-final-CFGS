<?php
/* @var $this UsuarisController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Usuarises',
);

$this->menu=array(
	array('label'=>'Create Usuaris', 'url'=>array('create')),
	array('label'=>'Manage Usuaris', 'url'=>array('admin')),
);
?>

<h1>Usuarises</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
