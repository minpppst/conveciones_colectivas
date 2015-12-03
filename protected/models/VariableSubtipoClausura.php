<?php

/**
 * This is the model class for table "variable_subtipo_clausura".
 *
 * The followings are the available columns in table 'variable_subtipo_clausura':
 * @property string $id
 * @property string $id_subtipo
 * @property string $tipo_campo
 * @property string $nombre_variable
 * @property integer $tamanio
 * @property string $nomenclatura
 *
 * The followings are the available model relations:
 * @property Clausuras[] $clausurases
 * @property TiposCampos $tiposcampos
 * @property SubTipo $idSubtipo
 */
class VariableSubtipoClausura extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return VariableSubtipoClausura the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'variable_subtipo_clausura';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_subtipo, tipo_campo, nombre_variable, tamanio, nomenclatura', 'required'),
			array('tamanio', 'numerical', 'integerOnly'=>true),
			array('id_subtipo', 'length', 'max'=>20),
			array('tipo_campo, nombre_variable', 'length', 'max'=>255),
			array('nomenclatura', 'length', 'max'=>100),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, id_subtipo, tipo_campo, nombre_variable, tamanio, nomenclatura', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'clausurases' => array(self::HAS_MANY, 'Clausuras', 'id_variable'),
			'idSubtipo' => array(self::BELONGS_TO, 'SubTipo', 'id_subtipo'),
                        'tiposcampos' => array(self::BELONGS_TO, 'TiposCampos', 'tipo_campo'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'id_subtipo' => 'Id Subtipo',
			'tipo_campo' => 'Tipo Campo',
			'nombre_variable' => 'Nombre Variable',
			'tamanio' => 'Tamanio',
			'nomenclatura' => 'Nomenclatura',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id,true);
		$criteria->compare('id_subtipo',$this->id_subtipo,true);
		$criteria->compare('tipo_campo',$this->tipo_campo,true);
		$criteria->compare('nombre_variable',$this->nombre_variable,true);
		$criteria->compare('tamanio',$this->tamanio);
		$criteria->compare('nomenclatura',$this->nomenclatura,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
        
          public function behaviors()
                {
                    return array(
                        // Classname => path to Class
                        'ActiveRecordLogableBehavior'=>
                            'application.behaviors.ActiveRecordLogableBehavior',
                    );
                }
}