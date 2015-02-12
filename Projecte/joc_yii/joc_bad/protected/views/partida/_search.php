<?php
/* @var $this PartidaController */
/* @var $model Partida */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'id'); ?>
		<?php echo $form->textField($model,'id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'data'); ?>
		<?php echo $form->textField($model,'data'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'enemics'); ?>
		<?php echo $form->textField($model,'enemics'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'winner_id'); ?>
		<?php echo $form->textField($model,'winner_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'loser_id'); ?>
		<?php echo $form->textField($model,'loser_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'temps'); ?>
		<?php echo $form->textField($model,'temps'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->