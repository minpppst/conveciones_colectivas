<?php

/**
 * This is the model class for table "consultor".
 *
 * The followings are the available columns in table 'consultor':
 * @property string $id
 * @property string $nombres
 * @property integer $cedula
 * @property string $cod_convencion
 * @property string $cod_empresa
 * @property string $cod_sindicato
 *
 * The followings are the available model relations:
 * @property Sindicato $codSindicato
 * @property Empresa $codEmpresa
 */
class Consultor extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Consultor the static model class
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
		return 'consultor';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nombres, cedula, cod_convencion, cod_empresa, cod_sindicato', 'required'),
			array('cedula', 'numerical', 'integerOnly'=>true),
			array('nombres', 'length', 'max'=>200),
			array('cod_convencion, cod_empresa, cod_sindicato', 'length', 'max'=>20),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, nombres, cedula, cod_convencion, cod_empresa, cod_sindicato', 'safe', 'on'=>'search'),
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
			'codSindicato' => array(self::BELONGS_TO, 'Sindicato', 'cod_sindicato'),
			'codEmpresa' => array(self::BELONGS_TO, 'Empresa', 'cod_empresa'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'nombres' => 'Nombres',
			'cedula' => 'Cedula',
			'cod_convencion' => 'Cod Convencion',
			'cod_empresa' => 'Cod Empresa',
			'cod_sindicato' => 'Cod Sindicato',
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
		$criteria->compare('nombres',$this->nombres,true);
		$criteria->compare('cedula',$this->cedula);
		$criteria->compare('cod_convencion',$this->cod_convencion,true);
		$criteria->compare('cod_empresa',$this->cod_empresa,true);
		$criteria->compare('cod_sindicato',$this->cod_sindicato,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}