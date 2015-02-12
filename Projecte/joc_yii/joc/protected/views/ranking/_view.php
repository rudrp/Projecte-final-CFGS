<?php
/* @var $this RankingController */
/* @var $data Ranking */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('usuari_id')); ?>:</b>
	<?php echo CHtml::encode($data->usuari_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('usuari_guanyades_id')); ?>:</b>
	<?php echo CHtml::encode($data->usuari_guanyades_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('usuari_perdudes_id')); ?>:</b>
	<?php echo CHtml::encode($data->usuari_perdudes_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('score')); ?>:</b>
	<?php echo CHtml::encode($data->score); ?>
	<br />


</div>