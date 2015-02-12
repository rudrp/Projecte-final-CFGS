<?php
/* @var $this PartidaController */
/* @var $model Partida */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'partida-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'data'); ?>
		<?php echo $form->textField($model,'data'); ?>
		<?php echo $form->error($model,'data'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'enemics'); ?>
		<?php echo $form->textField($model,'enemics'); ?>
		<?php echo $form->error($model,'enemics'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'winner_id'); ?>
		<?php echo $form->textField($model,'winner_id'); ?>
		<?php echo $form->error($model,'winner_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'loser_id'); ?>
		<?php echo $form->textField($model,'loser_id'); ?>
		<?php echo $form->error($model,'loser_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'temps'); ?>
		<?php echo $form->textField($model,'temps'); ?>
		<?php echo $form->error($model,'temps'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->