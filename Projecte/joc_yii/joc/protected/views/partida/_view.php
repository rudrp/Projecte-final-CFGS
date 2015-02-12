<?php
/* @var $this PartidaController */
/* @var $data Partida */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('data')); ?>:</b>
	<?php echo CHtml::encode($data->data); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('enemics')); ?>:</b>
	<?php echo CHtml::encode($data->enemics); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('winner_id')); ?>:</b>
	<?php echo CHtml::encode($data->winner_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('loser_id')); ?>:</b>
	<?php echo CHtml::encode($data->loser_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('temps')); ?>:</b>
	<?php echo CHtml::encode($data->temps); ?>
	<br />


</div>