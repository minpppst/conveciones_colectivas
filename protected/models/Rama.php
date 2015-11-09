<?php

/**
 * This is the model class for table "rama".
 *
 * The followings are the available columns in table 'rama':
 * @property string $id
 * @property string $codigo_seccion
 * @property integer $codigo_division
 * @property integer $codigo_grupo
 * @property integer $codigo_clase
 * @property integer $codigo_rama
 * @property string $rama
 *
 * The followings are the available model relations:
 * @property Empresa[] $empresas
 */
class Rama extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Rama the static model class
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
		return 'rama';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('codigo_seccion, codigo_division, codigo_grupo, codigo_clase, codigo_rama, rama', 'required'),
			array('codigo_division, codigo_grupo, codigo_clase, codigo_rama', 'numerical', 'integerOnly'=>true),
			array('codigo_seccion', 'length', 'max'=>5),
			array('rama', 'length', 'max'=>255),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, codigo_seccion, codigo_division, codigo_grupo, codigo_clase, codigo_rama, rama', 'safe', 'on'=>'search'),
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
			'empresas' => array(self::HAS_MANY, 'Empresa', 'actividad_economica'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'codigo_seccion' => 'Codigo Seccion',
			'codigo_division' => 'Codigo Division',
			'codigo_grupo' => 'Codigo Grupo',
			'codigo_clase' => 'Codigo Clase',
			'codigo_rama' => 'Codigo Rama',
			'rama' => 'Rama',
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
		$criteria->compare('codigo_seccion',$this->codigo_seccion,true);
		$criteria->compare('codigo_division',$this->codigo_division);
		$criteria->compare('codigo_grupo',$this->codigo_grupo);
		$criteria->compare('codigo_clase',$this->codigo_clase);
		$criteria->compare('codigo_rama',$this->codigo_rama);
		$criteria->compare('rama',$this->rama,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}