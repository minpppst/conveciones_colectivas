<?php
/* @var $this SubTipoController */
/* @var $model SubTipo */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'sub-tipo-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'id_tipo_clausura'); 
		echo $form->dropDownList($model, 'id_tipo_clausura', CHtml::listData(TipoClausura::model()->findAll(
                        array(
                            'order' => 'nombre_tipo_clausura ASC')), 'id', 'nombre_tipo_clausura'), 
                        array(
                            'prompt' => 'Seleccione un Tipo de Clausura...',
                        )
            );
                    ?>
                
		<?php echo $form->error($model,'id_tipo_clausura'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'nombre_sub_tipo_clausura'); ?>
		<?php echo $form->textField($model,'nombre_sub_tipo_clausura',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'nombre_sub_tipo_clausura'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->