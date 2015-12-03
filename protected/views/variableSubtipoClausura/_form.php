<?php
/* @var $this VariableSubtipoClausuraController */
/* @var $model VariableSubtipoClausura */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'variable-subtipo-clausura-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'id_subtipo'); 
		echo $form->dropDownList($model, 'id_subtipo', CHtml::listData(SubTipo::model()->findAll(
                        array(
                            'order' => 'nombre_sub_tipo_clausura ASC')), 'id', 'nombre_sub_tipo_clausura'), 
                        array(
                            'prompt' => 'Seleccione un Sub Tipo de Clausura...',
                        )
            );
                ?>
		<?php echo $form->error($model,'id_subtipo'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'tipo_campo'); ?>
		<?php echo $form->dropDownList($model, 'tipo_campo', CHtml::listData(TiposCampos::model()->findAll(
                        array(
                            'order' => 'tipo ASC')), 'id', 'tipo'), 
                        array(
                            'prompt' => 'Seleccione un Tipo de Cammpo...',
                        )
            ); ?>
		<?php echo $form->error($model,'tipo_campo'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'nombre_variable'); ?>
		<?php echo $form->textField($model,'nombre_variable',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'nombre_variable'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'tamanio'); ?>
		<?php echo $form->textField($model,'tamanio'); ?>
		<?php echo $form->error($model,'tamanio'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'nomenclatura'); ?>
		<?php echo $form->textField($model,'nomenclatura',array('size'=>60,'maxlength'=>100))."Texto Explicativo del Valor a Introducir (Ejm: Bs.)" ?>
		<?php echo $form->error($model,'nomenclatura'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->