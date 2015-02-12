<?php
/* @var $this RankingController */
/* @var $model Ranking */
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
		<?php echo $form->label($model,'usuari_id'); ?>
		<?php echo $form->textField($model,'usuari_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'usuari_guanyades_id'); ?>
		<?php echo $form->textField($model,'usuari_guanyades_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'usuari_perdudes_id'); ?>
		<?php echo $form->textField($model,'usuari_perdudes_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'score'); ?>
		<?php echo $form->textField($model,'score'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->